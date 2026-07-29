# Explore: explore_1268
# Auto-generated LookML Explore File

include: "/views/domain_05/view_03805.view.lkml"
include: "/views/domain_07/view_03807.view.lkml"
include: "/views/domain_08/view_03808.view.lkml"
include: "/views/domain_09/view_03809.view.lkml"

explore: explore_1268 {
  label: "Explore Explore 1268"
  description: "Comprehensive analytics explore joining base view_03805 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03805
  
  always_filter: {
    filters: [view_03805.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03805.created_at_date: "7 days"]
    unless: [view_03805.id, view_03805.status]
  }

  join: view_03807 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03805.user_id} = ${view_03807.id} ;;
    required_joins: []
  }

  join: view_03808 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03805.account_id} = ${view_03808.account_id} ;;
    required_joins: [view_03807]
  }

  join: view_03809 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03805.category} = ${view_03809.category} ;;
  }

  access_filter: {
    field: view_03805.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03805.is_deleted} = false ;;
}
