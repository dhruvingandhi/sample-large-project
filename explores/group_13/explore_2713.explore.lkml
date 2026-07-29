# Explore: explore_2713
# Auto-generated LookML Explore File

include: "/views/domain_40/view_08140.view.lkml"
include: "/views/domain_42/view_08142.view.lkml"
include: "/views/domain_43/view_08143.view.lkml"
include: "/views/domain_44/view_08144.view.lkml"

explore: explore_2713 {
  label: "Explore Explore 2713"
  description: "Comprehensive analytics explore joining base view_08140 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08140
  
  always_filter: {
    filters: [view_08140.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08140.created_at_date: "7 days"]
    unless: [view_08140.id, view_08140.status]
  }

  join: view_08142 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08140.user_id} = ${view_08142.id} ;;
    required_joins: []
  }

  join: view_08143 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08140.account_id} = ${view_08143.account_id} ;;
    required_joins: [view_08142]
  }

  join: view_08144 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08140.category} = ${view_08144.category} ;;
  }

  access_filter: {
    field: view_08140.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08140.is_deleted} = false ;;
}
