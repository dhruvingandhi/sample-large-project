# Explore: explore_1393
# Auto-generated LookML Explore File

include: "/views/domain_30/view_04180.view.lkml"
include: "/views/domain_32/view_04182.view.lkml"
include: "/views/domain_33/view_04183.view.lkml"
include: "/views/domain_34/view_04184.view.lkml"

explore: explore_1393 {
  label: "Explore Explore 1393"
  description: "Comprehensive analytics explore joining base view_04180 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04180
  
  always_filter: {
    filters: [view_04180.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04180.created_at_date: "7 days"]
    unless: [view_04180.id, view_04180.status]
  }

  join: view_04182 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04180.user_id} = ${view_04182.id} ;;
    required_joins: []
  }

  join: view_04183 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04180.account_id} = ${view_04183.account_id} ;;
    required_joins: [view_04182]
  }

  join: view_04184 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04180.category} = ${view_04184.category} ;;
  }

  access_filter: {
    field: view_04180.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04180.is_deleted} = false ;;
}
