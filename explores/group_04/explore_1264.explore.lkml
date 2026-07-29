# Explore: explore_1264
# Auto-generated LookML Explore File

include: "/views/domain_43/view_03793.view.lkml"
include: "/views/domain_45/view_03795.view.lkml"
include: "/views/domain_46/view_03796.view.lkml"
include: "/views/domain_47/view_03797.view.lkml"

explore: explore_1264 {
  label: "Explore Explore 1264"
  description: "Comprehensive analytics explore joining base view_03793 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03793
  
  always_filter: {
    filters: [view_03793.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03793.created_at_date: "7 days"]
    unless: [view_03793.id, view_03793.status]
  }

  join: view_03795 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03793.user_id} = ${view_03795.id} ;;
    required_joins: []
  }

  join: view_03796 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03793.account_id} = ${view_03796.account_id} ;;
    required_joins: [view_03795]
  }

  join: view_03797 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03793.category} = ${view_03797.category} ;;
  }

  access_filter: {
    field: view_03793.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03793.is_deleted} = false ;;
}
