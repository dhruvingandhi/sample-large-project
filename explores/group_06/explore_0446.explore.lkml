# Explore: explore_0446
# Auto-generated LookML Explore File

include: "/views/domain_39/view_01339.view.lkml"
include: "/views/domain_41/view_01341.view.lkml"
include: "/views/domain_42/view_01342.view.lkml"
include: "/views/domain_43/view_01343.view.lkml"

explore: explore_0446 {
  label: "Explore Explore 0446"
  description: "Comprehensive analytics explore joining base view_01339 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01339
  
  always_filter: {
    filters: [view_01339.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01339.created_at_date: "7 days"]
    unless: [view_01339.id, view_01339.status]
  }

  join: view_01341 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01339.user_id} = ${view_01341.id} ;;
    required_joins: []
  }

  join: view_01342 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01339.account_id} = ${view_01342.account_id} ;;
    required_joins: [view_01341]
  }

  join: view_01343 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01339.category} = ${view_01343.category} ;;
  }

  access_filter: {
    field: view_01339.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01339.is_deleted} = false ;;
}
