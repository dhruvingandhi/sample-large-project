# Update for 2000 file diff target
# Explore: explore_3830
# Auto-generated LookML Explore File

include: "/views/domain_41/view_11491.view.lkml"
include: "/views/domain_43/view_11493.view.lkml"
include: "/views/domain_44/view_11494.view.lkml"
include: "/views/domain_45/view_11495.view.lkml"

explore: explore_3830 {
  label: "Explore Explore 3830"
  description: "Comprehensive analytics explore joining base view_11491 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11491
  
  always_filter: {
    filters: [view_11491.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11491.created_at_date: "7 days"]
    unless: [view_11491.id, view_11491.status]
  }

  join: view_11493 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11491.user_id} = ${view_11493.id} ;;
    required_joins: []
  }

  join: view_11494 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11491.account_id} = ${view_11494.account_id} ;;
    required_joins: [view_11493]
  }

  join: view_11495 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11491.category} = ${view_11495.category} ;;
  }

  access_filter: {
    field: view_11491.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11491.is_deleted} = false ;;
}
