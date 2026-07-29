# Explore: explore_0728
# Auto-generated LookML Explore File

include: "/views/domain_35/view_02185.view.lkml"
include: "/views/domain_37/view_02187.view.lkml"
include: "/views/domain_38/view_02188.view.lkml"
include: "/views/domain_39/view_02189.view.lkml"

explore: explore_0728 {
  label: "Explore Explore 0728"
  description: "Comprehensive analytics explore joining base view_02185 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02185
  
  always_filter: {
    filters: [view_02185.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02185.created_at_date: "7 days"]
    unless: [view_02185.id, view_02185.status]
  }

  join: view_02187 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02185.user_id} = ${view_02187.id} ;;
    required_joins: []
  }

  join: view_02188 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02185.account_id} = ${view_02188.account_id} ;;
    required_joins: [view_02187]
  }

  join: view_02189 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02185.category} = ${view_02189.category} ;;
  }

  access_filter: {
    field: view_02185.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02185.is_deleted} = false ;;
}
