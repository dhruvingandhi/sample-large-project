# Explore: explore_3584
# Auto-generated LookML Explore File

include: "/views/domain_03/view_10753.view.lkml"
include: "/views/domain_05/view_10755.view.lkml"
include: "/views/domain_06/view_10756.view.lkml"
include: "/views/domain_07/view_10757.view.lkml"

explore: explore_3584 {
  label: "Explore Explore 3584"
  description: "Comprehensive analytics explore joining base view_10753 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10753
  
  always_filter: {
    filters: [view_10753.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10753.created_at_date: "7 days"]
    unless: [view_10753.id, view_10753.status]
  }

  join: view_10755 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10753.user_id} = ${view_10755.id} ;;
    required_joins: []
  }

  join: view_10756 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10753.account_id} = ${view_10756.account_id} ;;
    required_joins: [view_10755]
  }

  join: view_10757 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10753.category} = ${view_10757.category} ;;
  }

  access_filter: {
    field: view_10753.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10753.is_deleted} = false ;;
}
