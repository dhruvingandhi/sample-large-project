# Explore: explore_0256
# Auto-generated LookML Explore File

include: "/views/domain_19/view_00769.view.lkml"
include: "/views/domain_21/view_00771.view.lkml"
include: "/views/domain_22/view_00772.view.lkml"
include: "/views/domain_23/view_00773.view.lkml"

explore: explore_0256 {
  label: "Explore Explore 0256"
  description: "Comprehensive analytics explore joining base view_00769 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_00769
  
  always_filter: {
    filters: [view_00769.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00769.created_at_date: "7 days"]
    unless: [view_00769.id, view_00769.status]
  }

  join: view_00771 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00769.user_id} = ${view_00771.id} ;;
    required_joins: []
  }

  join: view_00772 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00769.account_id} = ${view_00772.account_id} ;;
    required_joins: [view_00771]
  }

  join: view_00773 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00769.category} = ${view_00773.category} ;;
  }

  access_filter: {
    field: view_00769.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00769.is_deleted} = false ;;
}
