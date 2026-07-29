# Explore: explore_2913
# Auto-generated LookML Explore File

include: "/views/domain_40/view_08740.view.lkml"
include: "/views/domain_42/view_08742.view.lkml"
include: "/views/domain_43/view_08743.view.lkml"
include: "/views/domain_44/view_08744.view.lkml"

explore: explore_2913 {
  label: "Explore Explore 2913"
  description: "Comprehensive analytics explore joining base view_08740 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08740
  
  always_filter: {
    filters: [view_08740.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08740.created_at_date: "7 days"]
    unless: [view_08740.id, view_08740.status]
  }

  join: view_08742 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08740.user_id} = ${view_08742.id} ;;
    required_joins: []
  }

  join: view_08743 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08740.account_id} = ${view_08743.account_id} ;;
    required_joins: [view_08742]
  }

  join: view_08744 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08740.category} = ${view_08744.category} ;;
  }

  access_filter: {
    field: view_08740.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08740.is_deleted} = false ;;
}
