# Explore: explore_3132
# Auto-generated LookML Explore File

include: "/views/domain_47/view_09397.view.lkml"
include: "/views/domain_49/view_09399.view.lkml"
include: "/views/domain_50/view_09400.view.lkml"
include: "/views/domain_01/view_09401.view.lkml"

explore: explore_3132 {
  label: "Explore Explore 3132"
  description: "Comprehensive analytics explore joining base view_09397 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_09397
  
  always_filter: {
    filters: [view_09397.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09397.created_at_date: "7 days"]
    unless: [view_09397.id, view_09397.status]
  }

  join: view_09399 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09397.user_id} = ${view_09399.id} ;;
    required_joins: []
  }

  join: view_09400 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09397.account_id} = ${view_09400.account_id} ;;
    required_joins: [view_09399]
  }

  join: view_09401 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09397.category} = ${view_09401.category} ;;
  }

  access_filter: {
    field: view_09397.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09397.is_deleted} = false ;;
}
