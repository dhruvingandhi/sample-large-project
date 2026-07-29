# Explore: explore_0857
# Auto-generated LookML Explore File

include: "/views/domain_22/view_02572.view.lkml"
include: "/views/domain_24/view_02574.view.lkml"
include: "/views/domain_25/view_02575.view.lkml"
include: "/views/domain_26/view_02576.view.lkml"

explore: explore_0857 {
  label: "Explore Explore 0857"
  description: "Comprehensive analytics explore joining base view_02572 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_02572
  
  always_filter: {
    filters: [view_02572.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02572.created_at_date: "7 days"]
    unless: [view_02572.id, view_02572.status]
  }

  join: view_02574 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02572.user_id} = ${view_02574.id} ;;
    required_joins: []
  }

  join: view_02575 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02572.account_id} = ${view_02575.account_id} ;;
    required_joins: [view_02574]
  }

  join: view_02576 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02572.category} = ${view_02576.category} ;;
  }

  access_filter: {
    field: view_02572.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02572.is_deleted} = false ;;
}
