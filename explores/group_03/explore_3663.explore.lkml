# Explore: explore_3663
# Auto-generated LookML Explore File

include: "/views/domain_40/view_10990.view.lkml"
include: "/views/domain_42/view_10992.view.lkml"
include: "/views/domain_43/view_10993.view.lkml"
include: "/views/domain_44/view_10994.view.lkml"

explore: explore_3663 {
  label: "Explore Explore 3663"
  description: "Comprehensive analytics explore joining base view_10990 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10990
  
  always_filter: {
    filters: [view_10990.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10990.created_at_date: "7 days"]
    unless: [view_10990.id, view_10990.status]
  }

  join: view_10992 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10990.user_id} = ${view_10992.id} ;;
    required_joins: []
  }

  join: view_10993 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10990.account_id} = ${view_10993.account_id} ;;
    required_joins: [view_10992]
  }

  join: view_10994 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10990.category} = ${view_10994.category} ;;
  }

  access_filter: {
    field: view_10990.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10990.is_deleted} = false ;;
}
