# Explore: explore_1875
# Auto-generated LookML Explore File

include: "/views/domain_26/view_05626.view.lkml"
include: "/views/domain_28/view_05628.view.lkml"
include: "/views/domain_29/view_05629.view.lkml"
include: "/views/domain_30/view_05630.view.lkml"

explore: explore_1875 {
  label: "Explore Explore 1875"
  description: "Comprehensive analytics explore joining base view_05626 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05626
  
  always_filter: {
    filters: [view_05626.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05626.created_at_date: "7 days"]
    unless: [view_05626.id, view_05626.status]
  }

  join: view_05628 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05626.user_id} = ${view_05628.id} ;;
    required_joins: []
  }

  join: view_05629 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05626.account_id} = ${view_05629.account_id} ;;
    required_joins: [view_05628]
  }

  join: view_05630 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05626.category} = ${view_05630.category} ;;
  }

  access_filter: {
    field: view_05626.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05626.is_deleted} = false ;;
}
