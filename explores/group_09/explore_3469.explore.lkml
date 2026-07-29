# Explore: explore_3469
# Auto-generated LookML Explore File

include: "/views/domain_08/view_10408.view.lkml"
include: "/views/domain_10/view_10410.view.lkml"
include: "/views/domain_11/view_10411.view.lkml"
include: "/views/domain_12/view_10412.view.lkml"

explore: explore_3469 {
  label: "Explore Explore 3469"
  description: "Comprehensive analytics explore joining base view_10408 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_10408
  
  always_filter: {
    filters: [view_10408.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10408.created_at_date: "7 days"]
    unless: [view_10408.id, view_10408.status]
  }

  join: view_10410 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10408.user_id} = ${view_10410.id} ;;
    required_joins: []
  }

  join: view_10411 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10408.account_id} = ${view_10411.account_id} ;;
    required_joins: [view_10410]
  }

  join: view_10412 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10408.category} = ${view_10412.category} ;;
  }

  access_filter: {
    field: view_10408.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10408.is_deleted} = false ;;
}
