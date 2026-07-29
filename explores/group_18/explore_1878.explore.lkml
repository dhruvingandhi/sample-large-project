# Explore: explore_1878
# Auto-generated LookML Explore File

include: "/views/domain_35/view_05635.view.lkml"
include: "/views/domain_37/view_05637.view.lkml"
include: "/views/domain_38/view_05638.view.lkml"
include: "/views/domain_39/view_05639.view.lkml"

explore: explore_1878 {
  label: "Explore Explore 1878"
  description: "Comprehensive analytics explore joining base view_05635 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_05635
  
  always_filter: {
    filters: [view_05635.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05635.created_at_date: "7 days"]
    unless: [view_05635.id, view_05635.status]
  }

  join: view_05637 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05635.user_id} = ${view_05637.id} ;;
    required_joins: []
  }

  join: view_05638 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05635.account_id} = ${view_05638.account_id} ;;
    required_joins: [view_05637]
  }

  join: view_05639 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05635.category} = ${view_05639.category} ;;
  }

  access_filter: {
    field: view_05635.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05635.is_deleted} = false ;;
}
