# Explore: explore_1426
# Auto-generated LookML Explore File

include: "/views/domain_29/view_04279.view.lkml"
include: "/views/domain_31/view_04281.view.lkml"
include: "/views/domain_32/view_04282.view.lkml"
include: "/views/domain_33/view_04283.view.lkml"

explore: explore_1426 {
  label: "Explore Explore 1426"
  description: "Comprehensive analytics explore joining base view_04279 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04279
  
  always_filter: {
    filters: [view_04279.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04279.created_at_date: "7 days"]
    unless: [view_04279.id, view_04279.status]
  }

  join: view_04281 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04279.user_id} = ${view_04281.id} ;;
    required_joins: []
  }

  join: view_04282 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04279.account_id} = ${view_04282.account_id} ;;
    required_joins: [view_04281]
  }

  join: view_04283 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04279.category} = ${view_04283.category} ;;
  }

  access_filter: {
    field: view_04279.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04279.is_deleted} = false ;;
}
