# Explore: explore_1434
# Auto-generated LookML Explore File

include: "/views/domain_03/view_04303.view.lkml"
include: "/views/domain_05/view_04305.view.lkml"
include: "/views/domain_06/view_04306.view.lkml"
include: "/views/domain_07/view_04307.view.lkml"

explore: explore_1434 {
  label: "Explore Explore 1434"
  description: "Comprehensive analytics explore joining base view_04303 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04303
  
  always_filter: {
    filters: [view_04303.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04303.created_at_date: "7 days"]
    unless: [view_04303.id, view_04303.status]
  }

  join: view_04305 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04303.user_id} = ${view_04305.id} ;;
    required_joins: []
  }

  join: view_04306 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04303.account_id} = ${view_04306.account_id} ;;
    required_joins: [view_04305]
  }

  join: view_04307 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04303.category} = ${view_04307.category} ;;
  }

  access_filter: {
    field: view_04303.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04303.is_deleted} = false ;;
}
