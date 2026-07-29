# Explore: explore_1412
# Auto-generated LookML Explore File

include: "/views/domain_37/view_04237.view.lkml"
include: "/views/domain_39/view_04239.view.lkml"
include: "/views/domain_40/view_04240.view.lkml"
include: "/views/domain_41/view_04241.view.lkml"

explore: explore_1412 {
  label: "Explore Explore 1412"
  description: "Comprehensive analytics explore joining base view_04237 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_04237
  
  always_filter: {
    filters: [view_04237.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04237.created_at_date: "7 days"]
    unless: [view_04237.id, view_04237.status]
  }

  join: view_04239 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04237.user_id} = ${view_04239.id} ;;
    required_joins: []
  }

  join: view_04240 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04237.account_id} = ${view_04240.account_id} ;;
    required_joins: [view_04239]
  }

  join: view_04241 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04237.category} = ${view_04241.category} ;;
  }

  access_filter: {
    field: view_04237.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04237.is_deleted} = false ;;
}
