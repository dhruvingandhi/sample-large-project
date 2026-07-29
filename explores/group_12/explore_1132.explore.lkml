# Explore: explore_1132
# Auto-generated LookML Explore File

include: "/views/domain_47/view_03397.view.lkml"
include: "/views/domain_49/view_03399.view.lkml"
include: "/views/domain_50/view_03400.view.lkml"
include: "/views/domain_01/view_03401.view.lkml"

explore: explore_1132 {
  label: "Explore Explore 1132"
  description: "Comprehensive analytics explore joining base view_03397 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03397
  
  always_filter: {
    filters: [view_03397.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03397.created_at_date: "7 days"]
    unless: [view_03397.id, view_03397.status]
  }

  join: view_03399 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03397.user_id} = ${view_03399.id} ;;
    required_joins: []
  }

  join: view_03400 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03397.account_id} = ${view_03400.account_id} ;;
    required_joins: [view_03399]
  }

  join: view_03401 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03397.category} = ${view_03401.category} ;;
  }

  access_filter: {
    field: view_03397.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03397.is_deleted} = false ;;
}
