# Explore: explore_2894
# Auto-generated LookML Explore File

include: "/views/domain_33/view_08683.view.lkml"
include: "/views/domain_35/view_08685.view.lkml"
include: "/views/domain_36/view_08686.view.lkml"
include: "/views/domain_37/view_08687.view.lkml"

explore: explore_2894 {
  label: "Explore Explore 2894"
  description: "Comprehensive analytics explore joining base view_08683 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08683
  
  always_filter: {
    filters: [view_08683.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08683.created_at_date: "7 days"]
    unless: [view_08683.id, view_08683.status]
  }

  join: view_08685 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08683.user_id} = ${view_08685.id} ;;
    required_joins: []
  }

  join: view_08686 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08683.account_id} = ${view_08686.account_id} ;;
    required_joins: [view_08685]
  }

  join: view_08687 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08683.category} = ${view_08687.category} ;;
  }

  access_filter: {
    field: view_08683.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08683.is_deleted} = false ;;
}
