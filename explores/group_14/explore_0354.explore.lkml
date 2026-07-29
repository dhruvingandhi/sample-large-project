# Explore: explore_0354
# Auto-generated LookML Explore File

include: "/views/domain_13/view_01063.view.lkml"
include: "/views/domain_15/view_01065.view.lkml"
include: "/views/domain_16/view_01066.view.lkml"
include: "/views/domain_17/view_01067.view.lkml"

explore: explore_0354 {
  label: "Explore Explore 0354"
  description: "Comprehensive analytics explore joining base view_01063 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01063
  
  always_filter: {
    filters: [view_01063.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01063.created_at_date: "7 days"]
    unless: [view_01063.id, view_01063.status]
  }

  join: view_01065 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01063.user_id} = ${view_01065.id} ;;
    required_joins: []
  }

  join: view_01066 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01063.account_id} = ${view_01066.account_id} ;;
    required_joins: [view_01065]
  }

  join: view_01067 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01063.category} = ${view_01067.category} ;;
  }

  access_filter: {
    field: view_01063.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01063.is_deleted} = false ;;
}
