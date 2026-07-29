# Explore: explore_2209
# Auto-generated LookML Explore File

include: "/views/domain_28/view_06628.view.lkml"
include: "/views/domain_30/view_06630.view.lkml"
include: "/views/domain_31/view_06631.view.lkml"
include: "/views/domain_32/view_06632.view.lkml"

explore: explore_2209 {
  label: "Explore Explore 2209"
  description: "Comprehensive analytics explore joining base view_06628 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06628
  
  always_filter: {
    filters: [view_06628.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06628.created_at_date: "7 days"]
    unless: [view_06628.id, view_06628.status]
  }

  join: view_06630 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06628.user_id} = ${view_06630.id} ;;
    required_joins: []
  }

  join: view_06631 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06628.account_id} = ${view_06631.account_id} ;;
    required_joins: [view_06630]
  }

  join: view_06632 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06628.category} = ${view_06632.category} ;;
  }

  access_filter: {
    field: view_06628.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06628.is_deleted} = false ;;
}
