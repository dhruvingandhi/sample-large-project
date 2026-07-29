# Explore: explore_2663
# Auto-generated LookML Explore File

include: "/views/domain_40/view_07990.view.lkml"
include: "/views/domain_42/view_07992.view.lkml"
include: "/views/domain_43/view_07993.view.lkml"
include: "/views/domain_44/view_07994.view.lkml"

explore: explore_2663 {
  label: "Explore Explore 2663"
  description: "Comprehensive analytics explore joining base view_07990 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_07990
  
  always_filter: {
    filters: [view_07990.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07990.created_at_date: "7 days"]
    unless: [view_07990.id, view_07990.status]
  }

  join: view_07992 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07990.user_id} = ${view_07992.id} ;;
    required_joins: []
  }

  join: view_07993 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07990.account_id} = ${view_07993.account_id} ;;
    required_joins: [view_07992]
  }

  join: view_07994 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07990.category} = ${view_07994.category} ;;
  }

  access_filter: {
    field: view_07990.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07990.is_deleted} = false ;;
}
