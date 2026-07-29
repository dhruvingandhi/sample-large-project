# Explore: explore_1663
# Auto-generated LookML Explore File

include: "/views/domain_40/view_04990.view.lkml"
include: "/views/domain_42/view_04992.view.lkml"
include: "/views/domain_43/view_04993.view.lkml"
include: "/views/domain_44/view_04994.view.lkml"

explore: explore_1663 {
  label: "Explore Explore 1663"
  description: "Comprehensive analytics explore joining base view_04990 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04990
  
  always_filter: {
    filters: [view_04990.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04990.created_at_date: "7 days"]
    unless: [view_04990.id, view_04990.status]
  }

  join: view_04992 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04990.user_id} = ${view_04992.id} ;;
    required_joins: []
  }

  join: view_04993 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04990.account_id} = ${view_04993.account_id} ;;
    required_joins: [view_04992]
  }

  join: view_04994 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04990.category} = ${view_04994.category} ;;
  }

  access_filter: {
    field: view_04990.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04990.is_deleted} = false ;;
}
