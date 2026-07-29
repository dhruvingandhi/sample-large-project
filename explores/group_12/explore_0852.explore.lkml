# Explore: explore_0852
# Auto-generated LookML Explore File

include: "/views/domain_07/view_02557.view.lkml"
include: "/views/domain_09/view_02559.view.lkml"
include: "/views/domain_10/view_02560.view.lkml"
include: "/views/domain_11/view_02561.view.lkml"

explore: explore_0852 {
  label: "Explore Explore 0852"
  description: "Comprehensive analytics explore joining base view_02557 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02557
  
  always_filter: {
    filters: [view_02557.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02557.created_at_date: "7 days"]
    unless: [view_02557.id, view_02557.status]
  }

  join: view_02559 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02557.user_id} = ${view_02559.id} ;;
    required_joins: []
  }

  join: view_02560 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02557.account_id} = ${view_02560.account_id} ;;
    required_joins: [view_02559]
  }

  join: view_02561 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02557.category} = ${view_02561.category} ;;
  }

  access_filter: {
    field: view_02557.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02557.is_deleted} = false ;;
}
