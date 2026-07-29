# Explore: explore_0875
# Auto-generated LookML Explore File

include: "/views/domain_26/view_02626.view.lkml"
include: "/views/domain_28/view_02628.view.lkml"
include: "/views/domain_29/view_02629.view.lkml"
include: "/views/domain_30/view_02630.view.lkml"

explore: explore_0875 {
  label: "Explore Explore 0875"
  description: "Comprehensive analytics explore joining base view_02626 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_02626
  
  always_filter: {
    filters: [view_02626.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02626.created_at_date: "7 days"]
    unless: [view_02626.id, view_02626.status]
  }

  join: view_02628 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02626.user_id} = ${view_02628.id} ;;
    required_joins: []
  }

  join: view_02629 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02626.account_id} = ${view_02629.account_id} ;;
    required_joins: [view_02628]
  }

  join: view_02630 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02626.category} = ${view_02630.category} ;;
  }

  access_filter: {
    field: view_02626.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02626.is_deleted} = false ;;
}
