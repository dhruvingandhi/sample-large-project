# Explore: explore_2830
# Auto-generated LookML Explore File

include: "/views/domain_41/view_08491.view.lkml"
include: "/views/domain_43/view_08493.view.lkml"
include: "/views/domain_44/view_08494.view.lkml"
include: "/views/domain_45/view_08495.view.lkml"

explore: explore_2830 {
  label: "Explore Explore 2830"
  description: "Comprehensive analytics explore joining base view_08491 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_08491
  
  always_filter: {
    filters: [view_08491.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08491.created_at_date: "7 days"]
    unless: [view_08491.id, view_08491.status]
  }

  join: view_08493 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08491.user_id} = ${view_08493.id} ;;
    required_joins: []
  }

  join: view_08494 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08491.account_id} = ${view_08494.account_id} ;;
    required_joins: [view_08493]
  }

  join: view_08495 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08491.category} = ${view_08495.category} ;;
  }

  access_filter: {
    field: view_08491.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08491.is_deleted} = false ;;
}
