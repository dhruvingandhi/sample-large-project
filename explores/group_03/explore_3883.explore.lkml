# Explore: explore_3883
# Auto-generated LookML Explore File

include: "/views/domain_50/view_11650.view.lkml"
include: "/views/domain_02/view_11652.view.lkml"
include: "/views/domain_03/view_11653.view.lkml"
include: "/views/domain_04/view_11654.view.lkml"

explore: explore_3883 {
  label: "Explore Explore 3883"
  description: "Comprehensive analytics explore joining base view_11650 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_11650
  
  always_filter: {
    filters: [view_11650.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11650.created_at_date: "7 days"]
    unless: [view_11650.id, view_11650.status]
  }

  join: view_11652 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11650.user_id} = ${view_11652.id} ;;
    required_joins: []
  }

  join: view_11653 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11650.account_id} = ${view_11653.account_id} ;;
    required_joins: [view_11652]
  }

  join: view_11654 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11650.category} = ${view_11654.category} ;;
  }

  access_filter: {
    field: view_11650.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11650.is_deleted} = false ;;
}
