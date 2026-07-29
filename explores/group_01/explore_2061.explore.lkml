# Explore: explore_2061
# Auto-generated LookML Explore File

include: "/views/domain_34/view_06184.view.lkml"
include: "/views/domain_36/view_06186.view.lkml"
include: "/views/domain_37/view_06187.view.lkml"
include: "/views/domain_38/view_06188.view.lkml"

explore: explore_2061 {
  label: "Explore Explore 2061"
  description: "Comprehensive analytics explore joining base view_06184 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06184
  
  always_filter: {
    filters: [view_06184.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06184.created_at_date: "7 days"]
    unless: [view_06184.id, view_06184.status]
  }

  join: view_06186 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06184.user_id} = ${view_06186.id} ;;
    required_joins: []
  }

  join: view_06187 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06184.account_id} = ${view_06187.account_id} ;;
    required_joins: [view_06186]
  }

  join: view_06188 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06184.category} = ${view_06188.category} ;;
  }

  access_filter: {
    field: view_06184.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06184.is_deleted} = false ;;
}
