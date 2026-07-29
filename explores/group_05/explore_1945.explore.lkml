# Explore: explore_1945
# Auto-generated LookML Explore File

include: "/views/domain_36/view_05836.view.lkml"
include: "/views/domain_38/view_05838.view.lkml"
include: "/views/domain_39/view_05839.view.lkml"
include: "/views/domain_40/view_05840.view.lkml"

explore: explore_1945 {
  label: "Explore Explore 1945"
  description: "Comprehensive analytics explore joining base view_05836 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05836
  
  always_filter: {
    filters: [view_05836.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05836.created_at_date: "7 days"]
    unless: [view_05836.id, view_05836.status]
  }

  join: view_05838 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05836.user_id} = ${view_05838.id} ;;
    required_joins: []
  }

  join: view_05839 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05836.account_id} = ${view_05839.account_id} ;;
    required_joins: [view_05838]
  }

  join: view_05840 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05836.category} = ${view_05840.category} ;;
  }

  access_filter: {
    field: view_05836.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05836.is_deleted} = false ;;
}
