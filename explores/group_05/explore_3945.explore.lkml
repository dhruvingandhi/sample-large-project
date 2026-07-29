# Explore: explore_3945
# Auto-generated LookML Explore File

include: "/views/domain_36/view_11836.view.lkml"
include: "/views/domain_38/view_11838.view.lkml"
include: "/views/domain_39/view_11839.view.lkml"
include: "/views/domain_40/view_11840.view.lkml"

explore: explore_3945 {
  label: "Explore Explore 3945"
  description: "Comprehensive analytics explore joining base view_11836 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11836
  
  always_filter: {
    filters: [view_11836.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11836.created_at_date: "7 days"]
    unless: [view_11836.id, view_11836.status]
  }

  join: view_11838 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11836.user_id} = ${view_11838.id} ;;
    required_joins: []
  }

  join: view_11839 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11836.account_id} = ${view_11839.account_id} ;;
    required_joins: [view_11838]
  }

  join: view_11840 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11836.category} = ${view_11840.category} ;;
  }

  access_filter: {
    field: view_11836.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11836.is_deleted} = false ;;
}
