# Explore: explore_0828
# Auto-generated LookML Explore File

include: "/views/domain_35/view_02485.view.lkml"
include: "/views/domain_37/view_02487.view.lkml"
include: "/views/domain_38/view_02488.view.lkml"
include: "/views/domain_39/view_02489.view.lkml"

explore: explore_0828 {
  label: "Explore Explore 0828"
  description: "Comprehensive analytics explore joining base view_02485 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02485
  
  always_filter: {
    filters: [view_02485.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02485.created_at_date: "7 days"]
    unless: [view_02485.id, view_02485.status]
  }

  join: view_02487 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02485.user_id} = ${view_02487.id} ;;
    required_joins: []
  }

  join: view_02488 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02485.account_id} = ${view_02488.account_id} ;;
    required_joins: [view_02487]
  }

  join: view_02489 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02485.category} = ${view_02489.category} ;;
  }

  access_filter: {
    field: view_02485.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02485.is_deleted} = false ;;
}
