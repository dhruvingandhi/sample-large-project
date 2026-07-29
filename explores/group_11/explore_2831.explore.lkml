# Explore: explore_2831
# Auto-generated LookML Explore File

include: "/views/domain_44/view_08494.view.lkml"
include: "/views/domain_46/view_08496.view.lkml"
include: "/views/domain_47/view_08497.view.lkml"
include: "/views/domain_48/view_08498.view.lkml"

explore: explore_2831 {
  label: "Explore Explore 2831"
  description: "Comprehensive analytics explore joining base view_08494 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08494
  
  always_filter: {
    filters: [view_08494.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08494.created_at_date: "7 days"]
    unless: [view_08494.id, view_08494.status]
  }

  join: view_08496 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08494.user_id} = ${view_08496.id} ;;
    required_joins: []
  }

  join: view_08497 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08494.account_id} = ${view_08497.account_id} ;;
    required_joins: [view_08496]
  }

  join: view_08498 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08494.category} = ${view_08498.category} ;;
  }

  access_filter: {
    field: view_08494.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08494.is_deleted} = false ;;
}
