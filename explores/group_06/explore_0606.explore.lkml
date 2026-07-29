# Explore: explore_0606
# Auto-generated LookML Explore File

include: "/views/domain_19/view_01819.view.lkml"
include: "/views/domain_21/view_01821.view.lkml"
include: "/views/domain_22/view_01822.view.lkml"
include: "/views/domain_23/view_01823.view.lkml"

explore: explore_0606 {
  label: "Explore Explore 0606"
  description: "Comprehensive analytics explore joining base view_01819 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01819
  
  always_filter: {
    filters: [view_01819.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01819.created_at_date: "7 days"]
    unless: [view_01819.id, view_01819.status]
  }

  join: view_01821 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01819.user_id} = ${view_01821.id} ;;
    required_joins: []
  }

  join: view_01822 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01819.account_id} = ${view_01822.account_id} ;;
    required_joins: [view_01821]
  }

  join: view_01823 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01819.category} = ${view_01823.category} ;;
  }

  access_filter: {
    field: view_01819.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01819.is_deleted} = false ;;
}
