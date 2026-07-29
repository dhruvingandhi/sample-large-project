# Explore: explore_2875
# Auto-generated LookML Explore File

include: "/views/domain_26/view_08626.view.lkml"
include: "/views/domain_28/view_08628.view.lkml"
include: "/views/domain_29/view_08629.view.lkml"
include: "/views/domain_30/view_08630.view.lkml"

explore: explore_2875 {
  label: "Explore Explore 2875"
  description: "Comprehensive analytics explore joining base view_08626 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08626
  
  always_filter: {
    filters: [view_08626.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08626.created_at_date: "7 days"]
    unless: [view_08626.id, view_08626.status]
  }

  join: view_08628 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08626.user_id} = ${view_08628.id} ;;
    required_joins: []
  }

  join: view_08629 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08626.account_id} = ${view_08629.account_id} ;;
    required_joins: [view_08628]
  }

  join: view_08630 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08626.category} = ${view_08630.category} ;;
  }

  access_filter: {
    field: view_08626.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08626.is_deleted} = false ;;
}
