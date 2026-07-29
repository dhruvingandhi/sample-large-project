# Explore: explore_3556
# Auto-generated LookML Explore File

include: "/views/domain_19/view_10669.view.lkml"
include: "/views/domain_21/view_10671.view.lkml"
include: "/views/domain_22/view_10672.view.lkml"
include: "/views/domain_23/view_10673.view.lkml"

explore: explore_3556 {
  label: "Explore Explore 3556"
  description: "Comprehensive analytics explore joining base view_10669 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10669
  
  always_filter: {
    filters: [view_10669.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10669.created_at_date: "7 days"]
    unless: [view_10669.id, view_10669.status]
  }

  join: view_10671 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10669.user_id} = ${view_10671.id} ;;
    required_joins: []
  }

  join: view_10672 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10669.account_id} = ${view_10672.account_id} ;;
    required_joins: [view_10671]
  }

  join: view_10673 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10669.category} = ${view_10673.category} ;;
  }

  access_filter: {
    field: view_10669.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10669.is_deleted} = false ;;
}
