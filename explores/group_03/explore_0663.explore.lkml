# Explore: explore_0663
# Auto-generated LookML Explore File

include: "/views/domain_40/view_01990.view.lkml"
include: "/views/domain_42/view_01992.view.lkml"
include: "/views/domain_43/view_01993.view.lkml"
include: "/views/domain_44/view_01994.view.lkml"

explore: explore_0663 {
  label: "Explore Explore 0663"
  description: "Comprehensive analytics explore joining base view_01990 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01990
  
  always_filter: {
    filters: [view_01990.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01990.created_at_date: "7 days"]
    unless: [view_01990.id, view_01990.status]
  }

  join: view_01992 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01990.user_id} = ${view_01992.id} ;;
    required_joins: []
  }

  join: view_01993 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01990.account_id} = ${view_01993.account_id} ;;
    required_joins: [view_01992]
  }

  join: view_01994 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01990.category} = ${view_01994.category} ;;
  }

  access_filter: {
    field: view_01990.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01990.is_deleted} = false ;;
}
