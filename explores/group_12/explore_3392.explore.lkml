# Explore: explore_3392
# Auto-generated LookML Explore File

include: "/views/domain_27/view_10177.view.lkml"
include: "/views/domain_29/view_10179.view.lkml"
include: "/views/domain_30/view_10180.view.lkml"
include: "/views/domain_31/view_10181.view.lkml"

explore: explore_3392 {
  label: "Explore Explore 3392"
  description: "Comprehensive analytics explore joining base view_10177 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10177
  
  always_filter: {
    filters: [view_10177.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10177.created_at_date: "7 days"]
    unless: [view_10177.id, view_10177.status]
  }

  join: view_10179 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10177.user_id} = ${view_10179.id} ;;
    required_joins: []
  }

  join: view_10180 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10177.account_id} = ${view_10180.account_id} ;;
    required_joins: [view_10179]
  }

  join: view_10181 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10177.category} = ${view_10181.category} ;;
  }

  access_filter: {
    field: view_10177.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10177.is_deleted} = false ;;
}
