# Explore: explore_1629
# Auto-generated LookML Explore File

include: "/views/domain_38/view_04888.view.lkml"
include: "/views/domain_40/view_04890.view.lkml"
include: "/views/domain_41/view_04891.view.lkml"
include: "/views/domain_42/view_04892.view.lkml"

explore: explore_1629 {
  label: "Explore Explore 1629"
  description: "Comprehensive analytics explore joining base view_04888 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04888
  
  always_filter: {
    filters: [view_04888.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04888.created_at_date: "7 days"]
    unless: [view_04888.id, view_04888.status]
  }

  join: view_04890 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04888.user_id} = ${view_04890.id} ;;
    required_joins: []
  }

  join: view_04891 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04888.account_id} = ${view_04891.account_id} ;;
    required_joins: [view_04890]
  }

  join: view_04892 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04888.category} = ${view_04892.category} ;;
  }

  access_filter: {
    field: view_04888.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04888.is_deleted} = false ;;
}
