# Explore: explore_0539
# Auto-generated LookML Explore File

include: "/views/domain_18/view_01618.view.lkml"
include: "/views/domain_20/view_01620.view.lkml"
include: "/views/domain_21/view_01621.view.lkml"
include: "/views/domain_22/view_01622.view.lkml"

explore: explore_0539 {
  label: "Explore Explore 0539"
  description: "Comprehensive analytics explore joining base view_01618 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_01618
  
  always_filter: {
    filters: [view_01618.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01618.created_at_date: "7 days"]
    unless: [view_01618.id, view_01618.status]
  }

  join: view_01620 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01618.user_id} = ${view_01620.id} ;;
    required_joins: []
  }

  join: view_01621 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01618.account_id} = ${view_01621.account_id} ;;
    required_joins: [view_01620]
  }

  join: view_01622 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01618.category} = ${view_01622.category} ;;
  }

  access_filter: {
    field: view_01618.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01618.is_deleted} = false ;;
}
