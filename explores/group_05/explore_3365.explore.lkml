# Explore: explore_3365
# Auto-generated LookML Explore File

include: "/views/domain_46/view_10096.view.lkml"
include: "/views/domain_48/view_10098.view.lkml"
include: "/views/domain_49/view_10099.view.lkml"
include: "/views/domain_50/view_10100.view.lkml"

explore: explore_3365 {
  label: "Explore Explore 3365"
  description: "Comprehensive analytics explore joining base view_10096 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10096
  
  always_filter: {
    filters: [view_10096.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10096.created_at_date: "7 days"]
    unless: [view_10096.id, view_10096.status]
  }

  join: view_10098 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10096.user_id} = ${view_10098.id} ;;
    required_joins: []
  }

  join: view_10099 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10096.account_id} = ${view_10099.account_id} ;;
    required_joins: [view_10098]
  }

  join: view_10100 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10096.category} = ${view_10100.category} ;;
  }

  access_filter: {
    field: view_10096.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10096.is_deleted} = false ;;
}
