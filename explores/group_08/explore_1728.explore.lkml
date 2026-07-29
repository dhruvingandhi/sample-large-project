# Explore: explore_1728
# Auto-generated LookML Explore File

include: "/views/domain_35/view_05185.view.lkml"
include: "/views/domain_37/view_05187.view.lkml"
include: "/views/domain_38/view_05188.view.lkml"
include: "/views/domain_39/view_05189.view.lkml"

explore: explore_1728 {
  label: "Explore Explore 1728"
  description: "Comprehensive analytics explore joining base view_05185 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05185
  
  always_filter: {
    filters: [view_05185.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05185.created_at_date: "7 days"]
    unless: [view_05185.id, view_05185.status]
  }

  join: view_05187 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05185.user_id} = ${view_05187.id} ;;
    required_joins: []
  }

  join: view_05188 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05185.account_id} = ${view_05188.account_id} ;;
    required_joins: [view_05187]
  }

  join: view_05189 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05185.category} = ${view_05189.category} ;;
  }

  access_filter: {
    field: view_05185.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05185.is_deleted} = false ;;
}
