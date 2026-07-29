# Explore: explore_2321
# Auto-generated LookML Explore File

include: "/views/domain_14/view_06964.view.lkml"
include: "/views/domain_16/view_06966.view.lkml"
include: "/views/domain_17/view_06967.view.lkml"
include: "/views/domain_18/view_06968.view.lkml"

explore: explore_2321 {
  label: "Explore Explore 2321"
  description: "Comprehensive analytics explore joining base view_06964 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06964
  
  always_filter: {
    filters: [view_06964.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06964.created_at_date: "7 days"]
    unless: [view_06964.id, view_06964.status]
  }

  join: view_06966 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06964.user_id} = ${view_06966.id} ;;
    required_joins: []
  }

  join: view_06967 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06964.account_id} = ${view_06967.account_id} ;;
    required_joins: [view_06966]
  }

  join: view_06968 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06964.category} = ${view_06968.category} ;;
  }

  access_filter: {
    field: view_06964.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06964.is_deleted} = false ;;
}
