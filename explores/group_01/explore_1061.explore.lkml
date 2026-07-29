# Explore: explore_1061
# Auto-generated LookML Explore File

include: "/views/domain_34/view_03184.view.lkml"
include: "/views/domain_36/view_03186.view.lkml"
include: "/views/domain_37/view_03187.view.lkml"
include: "/views/domain_38/view_03188.view.lkml"

explore: explore_1061 {
  label: "Explore Explore 1061"
  description: "Comprehensive analytics explore joining base view_03184 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03184
  
  always_filter: {
    filters: [view_03184.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03184.created_at_date: "7 days"]
    unless: [view_03184.id, view_03184.status]
  }

  join: view_03186 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03184.user_id} = ${view_03186.id} ;;
    required_joins: []
  }

  join: view_03187 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03184.account_id} = ${view_03187.account_id} ;;
    required_joins: [view_03186]
  }

  join: view_03188 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03184.category} = ${view_03188.category} ;;
  }

  access_filter: {
    field: view_03184.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03184.is_deleted} = false ;;
}
