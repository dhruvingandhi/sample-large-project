# Explore: explore_0727
# Auto-generated LookML Explore File

include: "/views/domain_32/view_02182.view.lkml"
include: "/views/domain_34/view_02184.view.lkml"
include: "/views/domain_35/view_02185.view.lkml"
include: "/views/domain_36/view_02186.view.lkml"

explore: explore_0727 {
  label: "Explore Explore 0727"
  description: "Comprehensive analytics explore joining base view_02182 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_02182
  
  always_filter: {
    filters: [view_02182.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02182.created_at_date: "7 days"]
    unless: [view_02182.id, view_02182.status]
  }

  join: view_02184 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02182.user_id} = ${view_02184.id} ;;
    required_joins: []
  }

  join: view_02185 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02182.account_id} = ${view_02185.account_id} ;;
    required_joins: [view_02184]
  }

  join: view_02186 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02182.category} = ${view_02186.category} ;;
  }

  access_filter: {
    field: view_02182.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02182.is_deleted} = false ;;
}
