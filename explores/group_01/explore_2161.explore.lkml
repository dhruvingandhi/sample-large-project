# Explore: explore_2161
# Auto-generated LookML Explore File

include: "/views/domain_34/view_06484.view.lkml"
include: "/views/domain_36/view_06486.view.lkml"
include: "/views/domain_37/view_06487.view.lkml"
include: "/views/domain_38/view_06488.view.lkml"

explore: explore_2161 {
  label: "Explore Explore 2161"
  description: "Comprehensive analytics explore joining base view_06484 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06484
  
  always_filter: {
    filters: [view_06484.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06484.created_at_date: "7 days"]
    unless: [view_06484.id, view_06484.status]
  }

  join: view_06486 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06484.user_id} = ${view_06486.id} ;;
    required_joins: []
  }

  join: view_06487 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06484.account_id} = ${view_06487.account_id} ;;
    required_joins: [view_06486]
  }

  join: view_06488 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06484.category} = ${view_06488.category} ;;
  }

  access_filter: {
    field: view_06484.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06484.is_deleted} = false ;;
}
