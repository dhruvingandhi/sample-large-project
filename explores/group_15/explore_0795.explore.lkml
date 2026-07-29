# Explore: explore_0795
# Auto-generated LookML Explore File

include: "/views/domain_36/view_02386.view.lkml"
include: "/views/domain_38/view_02388.view.lkml"
include: "/views/domain_39/view_02389.view.lkml"
include: "/views/domain_40/view_02390.view.lkml"

explore: explore_0795 {
  label: "Explore Explore 0795"
  description: "Comprehensive analytics explore joining base view_02386 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_02386
  
  always_filter: {
    filters: [view_02386.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02386.created_at_date: "7 days"]
    unless: [view_02386.id, view_02386.status]
  }

  join: view_02388 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02386.user_id} = ${view_02388.id} ;;
    required_joins: []
  }

  join: view_02389 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02386.account_id} = ${view_02389.account_id} ;;
    required_joins: [view_02388]
  }

  join: view_02390 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02386.category} = ${view_02390.category} ;;
  }

  access_filter: {
    field: view_02386.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02386.is_deleted} = false ;;
}
