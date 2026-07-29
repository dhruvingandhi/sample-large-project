# Explore: explore_0556
# Auto-generated LookML Explore File

include: "/views/domain_19/view_01669.view.lkml"
include: "/views/domain_21/view_01671.view.lkml"
include: "/views/domain_22/view_01672.view.lkml"
include: "/views/domain_23/view_01673.view.lkml"

explore: explore_0556 {
  label: "Explore Explore 0556"
  description: "Comprehensive analytics explore joining base view_01669 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01669
  
  always_filter: {
    filters: [view_01669.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01669.created_at_date: "7 days"]
    unless: [view_01669.id, view_01669.status]
  }

  join: view_01671 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01669.user_id} = ${view_01671.id} ;;
    required_joins: []
  }

  join: view_01672 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01669.account_id} = ${view_01672.account_id} ;;
    required_joins: [view_01671]
  }

  join: view_01673 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01669.category} = ${view_01673.category} ;;
  }

  access_filter: {
    field: view_01669.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01669.is_deleted} = false ;;
}
