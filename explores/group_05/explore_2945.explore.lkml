# Explore: explore_2945
# Auto-generated LookML Explore File

include: "/views/domain_36/view_08836.view.lkml"
include: "/views/domain_38/view_08838.view.lkml"
include: "/views/domain_39/view_08839.view.lkml"
include: "/views/domain_40/view_08840.view.lkml"

explore: explore_2945 {
  label: "Explore Explore 2945"
  description: "Comprehensive analytics explore joining base view_08836 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_08836
  
  always_filter: {
    filters: [view_08836.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08836.created_at_date: "7 days"]
    unless: [view_08836.id, view_08836.status]
  }

  join: view_08838 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08836.user_id} = ${view_08838.id} ;;
    required_joins: []
  }

  join: view_08839 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08836.account_id} = ${view_08839.account_id} ;;
    required_joins: [view_08838]
  }

  join: view_08840 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08836.category} = ${view_08840.category} ;;
  }

  access_filter: {
    field: view_08836.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08836.is_deleted} = false ;;
}
