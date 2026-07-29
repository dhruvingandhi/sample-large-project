# Explore: explore_3342
# Auto-generated LookML Explore File

include: "/views/domain_27/view_10027.view.lkml"
include: "/views/domain_29/view_10029.view.lkml"
include: "/views/domain_30/view_10030.view.lkml"
include: "/views/domain_31/view_10031.view.lkml"

explore: explore_3342 {
  label: "Explore Explore 3342"
  description: "Comprehensive analytics explore joining base view_10027 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10027
  
  always_filter: {
    filters: [view_10027.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10027.created_at_date: "7 days"]
    unless: [view_10027.id, view_10027.status]
  }

  join: view_10029 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10027.user_id} = ${view_10029.id} ;;
    required_joins: []
  }

  join: view_10030 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10027.account_id} = ${view_10030.account_id} ;;
    required_joins: [view_10029]
  }

  join: view_10031 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10027.category} = ${view_10031.category} ;;
  }

  access_filter: {
    field: view_10027.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10027.is_deleted} = false ;;
}
