# Explore: explore_3061
# Auto-generated LookML Explore File

include: "/views/domain_34/view_09184.view.lkml"
include: "/views/domain_36/view_09186.view.lkml"
include: "/views/domain_37/view_09187.view.lkml"
include: "/views/domain_38/view_09188.view.lkml"

explore: explore_3061 {
  label: "Explore Explore 3061"
  description: "Comprehensive analytics explore joining base view_09184 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09184
  
  always_filter: {
    filters: [view_09184.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09184.created_at_date: "7 days"]
    unless: [view_09184.id, view_09184.status]
  }

  join: view_09186 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09184.user_id} = ${view_09186.id} ;;
    required_joins: []
  }

  join: view_09187 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09184.account_id} = ${view_09187.account_id} ;;
    required_joins: [view_09186]
  }

  join: view_09188 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09184.category} = ${view_09188.category} ;;
  }

  access_filter: {
    field: view_09184.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09184.is_deleted} = false ;;
}
