# Explore: explore_1556
# Auto-generated LookML Explore File

include: "/views/domain_19/view_04669.view.lkml"
include: "/views/domain_21/view_04671.view.lkml"
include: "/views/domain_22/view_04672.view.lkml"
include: "/views/domain_23/view_04673.view.lkml"

explore: explore_1556 {
  label: "Explore Explore 1556"
  description: "Comprehensive analytics explore joining base view_04669 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04669
  
  always_filter: {
    filters: [view_04669.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04669.created_at_date: "7 days"]
    unless: [view_04669.id, view_04669.status]
  }

  join: view_04671 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04669.user_id} = ${view_04671.id} ;;
    required_joins: []
  }

  join: view_04672 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04669.account_id} = ${view_04672.account_id} ;;
    required_joins: [view_04671]
  }

  join: view_04673 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04669.category} = ${view_04673.category} ;;
  }

  access_filter: {
    field: view_04669.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04669.is_deleted} = false ;;
}
