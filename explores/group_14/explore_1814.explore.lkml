# Explore: explore_1814
# Auto-generated LookML Explore File

include: "/views/domain_43/view_05443.view.lkml"
include: "/views/domain_45/view_05445.view.lkml"
include: "/views/domain_46/view_05446.view.lkml"
include: "/views/domain_47/view_05447.view.lkml"

explore: explore_1814 {
  label: "Explore Explore 1814"
  description: "Comprehensive analytics explore joining base view_05443 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_05443
  
  always_filter: {
    filters: [view_05443.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05443.created_at_date: "7 days"]
    unless: [view_05443.id, view_05443.status]
  }

  join: view_05445 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05443.user_id} = ${view_05445.id} ;;
    required_joins: []
  }

  join: view_05446 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05443.account_id} = ${view_05446.account_id} ;;
    required_joins: [view_05445]
  }

  join: view_05447 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05443.category} = ${view_05447.category} ;;
  }

  access_filter: {
    field: view_05443.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05443.is_deleted} = false ;;
}
