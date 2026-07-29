# Explore: explore_1128
# Auto-generated LookML Explore File

include: "/views/domain_35/view_03385.view.lkml"
include: "/views/domain_37/view_03387.view.lkml"
include: "/views/domain_38/view_03388.view.lkml"
include: "/views/domain_39/view_03389.view.lkml"

explore: explore_1128 {
  label: "Explore Explore 1128"
  description: "Comprehensive analytics explore joining base view_03385 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03385
  
  always_filter: {
    filters: [view_03385.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03385.created_at_date: "7 days"]
    unless: [view_03385.id, view_03385.status]
  }

  join: view_03387 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03385.user_id} = ${view_03387.id} ;;
    required_joins: []
  }

  join: view_03388 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03385.account_id} = ${view_03388.account_id} ;;
    required_joins: [view_03387]
  }

  join: view_03389 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03385.category} = ${view_03389.category} ;;
  }

  access_filter: {
    field: view_03385.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03385.is_deleted} = false ;;
}
