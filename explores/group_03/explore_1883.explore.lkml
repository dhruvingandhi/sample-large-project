# Explore: explore_1883
# Auto-generated LookML Explore File

include: "/views/domain_50/view_05650.view.lkml"
include: "/views/domain_02/view_05652.view.lkml"
include: "/views/domain_03/view_05653.view.lkml"
include: "/views/domain_04/view_05654.view.lkml"

explore: explore_1883 {
  label: "Explore Explore 1883"
  description: "Comprehensive analytics explore joining base view_05650 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05650
  
  always_filter: {
    filters: [view_05650.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05650.created_at_date: "7 days"]
    unless: [view_05650.id, view_05650.status]
  }

  join: view_05652 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05650.user_id} = ${view_05652.id} ;;
    required_joins: []
  }

  join: view_05653 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05650.account_id} = ${view_05653.account_id} ;;
    required_joins: [view_05652]
  }

  join: view_05654 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05650.category} = ${view_05654.category} ;;
  }

  access_filter: {
    field: view_05650.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05650.is_deleted} = false ;;
}
